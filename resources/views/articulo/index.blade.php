@extends('layouts.plantillabase')

@section('contenido')
 <a href="articulos/create" class="btn btn-primary">CREAR</a>

<table class="table table-dark table-striped mt-4">
    <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">CÓDIGO</th>
            <th scope="col">DESCRIPCIÓN</th>
            <th scope="col">CANTIDAD</th>
            <th scope="col">PRECIO</th>
            <th scope="col">ACCIONES</th>
        </tr>
    </thead>
    <tbody>

        @foreach ($articulos as $articulos)
            <tr>
                <td>{{$articulo->id}}</td>
                <td>{{$articulo->codigo}}</td>
                <td>{{$articulo->descripcion}}</td>
                <td>{{$articulo->cantidad}}</td>
                <td>{{$articulo->precio}}</td>
                <td>
                    <a class="btn btn-info">editar</a>
                    <button class="btn btn-danger">ELIMINAR</button>
                </td>
            </tr>
        @endforeach
       
    </tbody>
</table>
@endsection