@extends('layouts.plantillabase')

@section('contenido')
 <h2>EDITAR REGISTROS</h2>
 @csrf
 @method('PUT')
@endsection