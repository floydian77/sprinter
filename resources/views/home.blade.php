@extends('layouts.main')

@section('content')
    @foreach(range(1,8) as $r)
        <div>
            Col{{$r}}
        </div>
    @endforeach
@stop
