<div class="col-lg-6" >
    <div class="card-box" id="employee-performance-breakdown">
        <?php
    /*
        if(\Auth::user()->etid == 3 || \Auth::user()->etid == 4){
            $units = DB::table('code_master')->where('type','unit')->whereIn('key',$employee->units)->get();
        }else{
            $units = DB::table('code_master')->where('type','unit')->whereIn('key',\Auth::user()->units)->get();
        }
        */
 		$units = DB::table('code_master')->where('type','unit')->whereIn('key',$employee->units)->get();
        $i=0;
        ?>
        <ul class="nav nav-tabs navtab-bg nav-justified qa-tab">
        	@if(count($units) > 1)
            <li class="active">
                <a href="#All" data-toggle="tab" aria-expanded="false">
                    <span>All</span>
                </a>
            </li>
            @endif
            @foreach ($units as $key)
            @if(count($units) > 1)
            	<li>
            @else
            	 <li class="{{ $i==0?'active':'' }}">
            @endif
                <a href="#<?=str_replace('.', '', str_replace(' ', '', $key->value))?>" data-toggle="tab" aria-expanded="false">
                    <span>{{ $key->value }}</span>
                </a>
            </li>
            <?php $i++; ?>
            @endforeach
        </ul>
        <h4 class="text-center"><b>Performance Breakdown</b></h4>        
        <p class="text-muted m-b-30 font-13 text-center">
            
        </p>      
        <div>  
        <div class = "nav text-center">
            {{-- imtoantran fix non numberic encountered --}}
            {{--*/ $i = 0 /*--}}
            @foreach($Qnotes as $notes)
            <div class = "qa-key">
                @if($i == count($Qnotes) - 1)
                <div class ="qa-display text-center">{{$notes->display_name}}</div>
                @else
                <div class ="qa-display text-center border-right">{{$notes->display_name}}</div>
                @endif
                <div class ="qa-value text-center">{{$notes->value}}</div>                
            </div >
            {{--*/ $i = $i + 1 /*--}}            
            @endforeach
        </div>
        
        </div>

        <p class="text-muted m-b-30 font-13 text-center">
            
        </p>
        <div class="tab-content">
        	@if(count($units) > 1)
            <div class="tab-pane active" id="All" >
                <div class="w-info-chart-meta">
                    @foreach ($Q_all as $element)
                        <div class="progress-wrap">
                            <div class="clearfix progress-meta">
                                <span class="pull-left progress-label">{{ $element->question }}</span>
                                @if($element->css_class)
                                    <span class="pull-right progress-percent label" style="background-color:{{ $element->css_class }}">{{ $element->rating or 0 }}
                                        %</span>
                                @else
                                    <span class="pull-right progress-percent label label-info ">{{ $element->rating or 0 }}%</span>
                                @endif
                            </div>
                            <div class="progress progress-sm">
                                @if($element->css_class)
                                    <div class="progress-bar"
                                         data-progress="{{ $element->rating or 0 }}"
                                         style="width: {{ $element->rating  or 0 }}%;background-color:{{ $element->css_class }}">
                                    </div>
                                @else
                                    <div class="progress-bar progress-bar-info"
                                         data-progress="{{ $element->rating or 0 }}"
                                         style="width: {{ $element->rating  or 0 }}%;">
                                    </div>
                                @endif
                            </div>
                        </div>
                        <p>&nbsp;</p>
                    @endforeach
                </div>
            </div>
            @endif
            <?php $i = 0; ?>
            @foreach ($Q as $key=>$item)
            	@if(count($units) > 1)
	            	<div class="tab-pane" id="<?=str_replace('.', '', str_replace(' ', '', $key))?>" >
	            @else
	            <div class="tab-pane active" id="<?=str_replace('.', '', str_replace(' ', '', $key))?>" >
            	@endif
                    <div class="w-info-chart-meta">
                        @foreach ($item as $element)
                            <div class="progress-wrap">
                                <div class="clearfix progress-meta">
                                    <span class="pull-left progress-label">{{ $element->question }}</span>
                                    @if($element->css_class)
                                        <span class="pull-right progress-percent label" style="background-color:{{ $element->css_class }}">{{ $element->rating or 0 }}
                                            %</span>
                                    @else
                                        <span class="pull-right progress-percent label label-info ">{{ $element->rating or 0 }}%</span>
                                    @endif
                                </div>
                                <div class="progress progress-sm">
                                    @if($element->css_class)
                                        <div class="progress-bar"
                                             data-progress="{{ $element->rating or 0 }}"
                                             style="width: {{ $element->rating  or 0 }}%;background-color:{{ $element->css_class }}">
                                        </div>
                                    @else
                                        <div class="progress-bar progress-bar-info"
                                             data-progress="{{ $element->rating or 0 }}"
                                             style="width: {{ $element->rating  or 0 }}%;">
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <p>&nbsp;</p>
                        @endforeach
                    </div>
                </div>
                <?php $i++; ?>
            @endforeach
        </div>
    </div>
</div>