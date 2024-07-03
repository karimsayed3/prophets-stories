import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'models/film_data_model.dart';
import 'models/series_data_model.dart';
import 'models/category_model.dart';

class FireStoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile, String path) async {
    try {
      var ref = _storage.ref().child(path);
      var uploadTask = await ref.putFile(imageFile);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  Future<void> addSeriesCategory(Category<SeriesData> category)async {
    var docRef = _db.collection('series_categories').doc(); // Generate a new document reference with a unique ID
    category.id = docRef.id; // Set the ID of the film to this generated ID
    await docRef.set(category.toMap());
  }

  /// Add a new film to the database
  Future<void> addFilm(FilmData film) async {
    var docRef = _db.collection('films').doc(); // Generate a new document reference with a unique ID
    film.id = docRef.id; // Set the ID of the film to this generated ID
    await docRef.set(film.toMap());
    // await _db.collection('films').add(film.toMap());
  }

  /// Get all films from the database
  Future<List<FilmData>> getFilms() async {
    var snapshot = await _db.collection('films').get();
    return snapshot.docs
        .map((doc) => FilmData.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<List<Category<SeriesData>>> getSeriesCategories() async {
    var snapshot = await _db.collection('series_categories').get();
    return snapshot.docs
        .map((doc) => Category<SeriesData>.fromMap(
            doc.data(), doc.id, (item) => SeriesData.fromMap(item)))
        .toList();
  }

  Future<Category<SeriesData>> getSeriesCategoryById(String id) async {
    var doc = await _db.collection('series_categories').doc(id).get();
    return Category<SeriesData>.fromMap(doc.data() as Map<String, dynamic>,
        doc.id, (item) => SeriesData.fromMap(item));
  }

  Future<void> addSeriesToCategory(String categoryId, SeriesData series) async {
    var category = await getSeriesCategoryById(categoryId);
    var updatedItems = List<SeriesData>.from(category.items)..add(series);
    _db.collection('series_categories').doc(categoryId).update({
      'items': updatedItems.map((f) => f.toMap()).toList(),
    });
  }
}
