@extends('layouts.plantillabase')

@section('contenido')
 <h2>EDITAR REGISTROS</h2>




<form action="/articulos/{{$articulo->id}}" method="post">
    @csrf
    @method('PUT')
    <div class="mb-3">  
        <label for="" class="form-label">Código</label>
        <input type="text" name="codigo" id="codigo" class="form-control" value="{{$articulo->codigo}}" tabindex="1">
    </div>

    <div class="mb-3">  
        <label for="" class="form-label">Descripción</label>
        <input type="text" name="descripcion" id="descripcion" class="form-control" value="{{$articulo->descripcion}}" tabindex="2">
    </div>

    <div class="mb-3">  
        <label for="" class="form-label">cantidad</label>
        <input type="number" name="cantidad" id="cantidad" class="form-control" value="{{$articulo->cantidad}}" tabindex="3">
    </div>

    <div class="mb-3">  
        <label for="" class="form-label">Precio</label>
        <input type="number" name="precio" id="precio" class="form-control" step="any" value="0.00" value="{{$articulo->precio}}" tabindex="4">
    </div>

    <a href="/articulos" class="btn btn-secondary" tabindex="5">Cancelar</a>
    <button type="submit" class="btn btn-primary" tabindex="6">Guardar</button>
</form>
@endsection