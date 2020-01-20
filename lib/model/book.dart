import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';


part 'book.g.dart';


//  BEGIN mynewdb.db MODEL
//  Paste the following code into your model.dart
//  Enjoy.. Huseyin Tokpunar


// BEGIN TABLES
const tableBook = SqfEntityTable(
    tableName: 'book',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)
    fields: [
      SqfEntityField('testament_id', DbType.integer),
      SqfEntityField('name', DbType.text),
      SqfEntityField('abbreviation', DbType.text),

    ]);
const tableMetadata = SqfEntityTable(
    tableName: 'metadata',
    primaryKeyName: 'key',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)
    fields: [
      SqfEntityField('value', DbType.text),

    ]);
const tableTestament = SqfEntityTable(
    tableName: 'testament',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)
    fields: [
      SqfEntityField('name', DbType.text),

    ]);
const tableVerse = SqfEntityTable(
    tableName: 'verse',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)
    fields: [
      SqfEntityField('book_id', DbType.integer),
      SqfEntityField('chapter', DbType.integer),
      SqfEntityField('verse', DbType.integer),
      SqfEntityField('text', DbType.text),

    ]);
// END TABLES


// BEGIN DATABASE MODEL
@SqfEntityBuilder(mynewdbdb)
const mynewdbdb = SqfEntityModel(
    modelName: 'Mynewdbdb',
    databaseName: 'mynewdb.db',
    databaseTables: [tableBook,
      tableMetadata,
      tableTestament,
      tableVerse,
    ],
    // put defined sequences into the sequences list.
    bundledDatabasePath:
    'assets/rvr1960.sqlite'
);
// END mynewdb.db MODEL