<div class="col-lg-6">
    <div class="card-box" id="qa-tab">
        {{-- tabs --}}
        <ul class="nav nav-tabs navtab-bg nav-justified qa-tab">
            <li class="active">
                <a href="#unit" data-toggle="tab" aria-expanded="true">
                    @if(\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1)
                    <span style="text-transform: capitalize">Facility</span>
                    @else
                    <span style="text-transform: capitalize">Unit</span>
                    @endif
                </a>
            </li>
            @foreach ($rating_question_by_unit as $key=> $element)
            <li class="">
                <a href="#<?=str_replace('.', '', str_replace(' ', '', $key))?>" data-toggle="tab" aria-expanded="false">
                    <span style="text-transform: capitalize">{{ $key }}</span>
                </a>
            </li>
            @endforeach
        </ul>
        {{-- notes --}}
        <p class="text-muted m-b-30 font-13 text-center">

        </p>
        <div class = "nav text-center">
            {{--*/ $i = 0 /*--}}
            @foreach($Qnotes as $notes)
            <div class = "qa-key">
                @if($i == count($Qnotes) - 1)
                <div class ="qa-display text-center font-14">{{$notes->display_name}}</div>
                @else
                <div class ="qa-display text-center font-14 border-right">{{$notes->display_name}}</div>
                @endif
                <div class ="qa-value text-center font-14">{{$notes->value}}</div>                
            </div >
            {{--*/ $i = $i + 1 /*--}}            
            @endforeach
        </div>
        <p class="text-muted m-b-30 font-13 text-center">            
        </p>
        {{-- tabs content --}}
        <div class="tab-content">
            <div class="tab-pane active" id="unit">
                <div class="w-info-chart-meta">
                    @foreach ($rating_question_by_discipline_unit as $element)
                    <div class="progress-wrap">
                        <div class="clearfix progress-meta">
                            <span class="pull-left progress-label">{{ $element->question }}</span>
                            @if($element->css_class)
                            <span class="pull-right progress-percent label" style="background-color:{{ $element->css_class }}">{{ $element->rate or 0 }}
                                %</span>
                                @else
                                <span class="pull-right progress-percent label label-info ">{{ $element->rate or 0 }}%</span>
                                @endif
                            </div>
                            <div class="progress progress-sm">
                                @if($element->css_class)
                                <div class="progress-bar"
                                data-progress="{{ $element->rate or 0 }}"
                                style="width: {{ $element->rate  or 0 }}%;background-color:{{ $element->css_class }}">
                                </div>
                            @else
                            <div class="progress-bar progress-bar-info"
                               data-progress="{{ $element->rate or 0 }}"
                               style="width: {{ $element->rate  or 0 }}%;">
                           </div>
                            @endif
                       </div>
                   </div>
                   <p>&nbsp;</p>
                   @endforeach
               </div>
           </div>

           @foreach ($rating_question_by_unit as $key=> $Q)
           <div class="tab-pane" id="<?=str_replace('.', '', str_replace(' ', '', $key))?>">
            <div class="w-info-chart-meta">
             @foreach ($Q as $element)
             <div class="progress-wrap">
                <div class="clearfix progress-meta">
                    <span class="pull-left progress-label">{{ $element->question }}</span>
                    @if($element->css_class)
                    <span class="pull-right progress-percent label" style="background-color:{{ $element->css_class }}">{{ $element->rate or 0 }}
                        %</span>
                        @else
                        <span class="pull-right progress-percent label label-info ">{{ $element->rate or 0 }}%</span>
                        @endif
                    </div>
                    <div class="progress progress-sm">
                     @if($element->css_class)
                        <div class="progress-bar"
                           data-progress="{{ $element->rate or 0 }}"
                           style="width: {{ $element->rate  or 0 }}%;background-color:{{ $element->css_class }}">
                       </div>
                       @else
                       <div class="progress-bar progress-bar-info"
                           data-progress="{{ $element->rate or 0 }}"
                           style="width: {{ $element->rate  or 0 }}%;">
                       </div>
                       @endif
                   </div>
               </div>
               <p>&nbsp;</p>
               @endforeach
           </div>
       </div>
       @endforeach
   </div>
</div>
</div>