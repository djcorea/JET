@extends('layouts.plantillabase')

@section('contenido')
 <h2>CREAR REGISTROS</h2>

<form action="/articulos" method="post">
    <div class="mb-3">  
        <label for="" class="form-label">Código</label>
        <input type="text" name="codigo" id="codigo" class="form-control" tabindex="1">
    </div>

    <div class="mb-3">  
        <label for="" class="form-label">Descripción</label>
        <input type="text" name="descripcion" id="descripcion" class="form-control" tabindex="1">
    </div>

    <div class="mb-3">  
        <label for="" class="form-label">cantidad</label>
        <input type="text" name="cantidad" id="cantidad" class="form-control" tabindex="1">
    </div>

    <div class="mb-3">  
        <label for="" class="form-label">Precio</label>
        <input type="text" name="precio" id="precio" class="form-control" tabindex="1">
    </div>
</form>
@endsection