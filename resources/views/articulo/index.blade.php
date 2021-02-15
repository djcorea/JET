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

        @foreach ($articulos as $articulo)
            <tr>
                <td>{{$articulo->id}}</td>
                <td>{{$articulo->codigo}}</td>
                <td>{{$articulo->descripcion}}</td>
                <td>{{$articulo->cantidad}}</td>
                <td>{{$articulo->precio}}</td>
                <td>
                 
                    <form action="{{route('articulos.destroy',$articulo->id)}}" method="post">
                       <a href="/articulos/{{$articulo->id}}/edit" class="btn btn-info">editar</a>
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">ELIMINAR</button>
                    </form>

                </td>
            </tr>
        @endforeach
       
    </tbody>
</table>
@endsection