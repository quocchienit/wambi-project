@extends('admin.layout')
@section('content')
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            <div class="card-box">
                <form action="{{ isset($reward)?route('admin::reward::edit',['employee'=>$reward->id]):route('admin::reward::add') }}"
                      method="post" accept-charset="utf-8" enctype="multipart/form-data">
                    {!! csrf_field() !!}
                    <h4 class="header-title">Rewards</h4>
                    {{-- gift card image --}}
                    <div class="form-group m-b-0">
                        <label class="control-label">Gift card image: </label>
                        @if(isset($reward))
                            <div>
                                <img src="{{url($reward->photo())}}" height="100">
                            </div>
                        @endif
                        <input type="file" class="filestyle" data-input="false" data-placeholder="Select image"
                               name="image">
                    </div>
                    {{-- UNIT --}}
                    @if(\Cache::get('function_amada') == 1)
                    <div class="form-group">
                        <label for="unit_id">Unit*</label>
                        <select name="unit_id" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Unit" id="unit_id">                        
                          @forelse ($units as $item)
                                <option value="{{ $item->key }}" {{ (isset($reward)&&$reward->unit_id == $item->key)|| (!isset($reward) && $item->key == \Session::get('current_unit')) ?"selected":"" }}>{{ $item->value }}</option>                            
                          @empty
                                {{-- empty expr --}}
                          @endforelse
                        </select>                
                    </div>
                    @endif

                    {{-- pecks --}}
                    <div class="form-group">
                        <h5 class="m-t-30">Pecks *</h5>
                        <input name="pecks" value="{{ $reward->pecks or '' }}" parsley-trigger="change" required
                               type="text" placeholder="Pecks" class="form-control">
                    </div>

                    <div class="form-group text-right m-b-0">
                        <button class="btn btn-primary waves-effect waves-light" type="submit">
                            Submit
                        </button>
                        <a href="{{ route('admin::reward::index') }}"
                           class="btn btn-default waves-effect waves-light m-l-5">
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop