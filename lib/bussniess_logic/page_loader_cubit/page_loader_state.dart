part of 'page_loader_cubit.dart';

@immutable
abstract class PageLoaderState {}

class PageLoaderInitial extends PageLoaderState {}

class PageLoaderLoding extends PageLoaderState {}

class PageLoaderLoded extends PageLoaderState {}
