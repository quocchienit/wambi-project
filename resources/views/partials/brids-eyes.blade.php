<table class="table table-striped table-hover table-responsive data-table" id="data-table-export">
    <thead>
        <tr>
            @if(\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1)
                <th style = "text-align: left; width: 25%; font-weight: bold;">Health System</th>
            @else
                <th style = "text-align: left; width: 25%; font-weight: bold;">Unit</th>
            @endif
            <th style = "text-align: center; width: 20%; font-weight: bold;">Birds-eye</th>
    		@if(\Cache::get('function_amada') != 1)
                <th style = "text-align: center; width: 25%; font-weight: bold;">Care Provider Performance</th>
            @else
                <th style = "text-align: center; width: 25%; font-weight: bold;">Caregiver Performance</th>
            @endif
            
            <th style = "text-align: center; width: 25%; font-weight: bold;">Organizational Perfomance</th>            
        </tr>
    </thead>
    <tbody>        
       @foreach ($datarating as $value)
        <tr>
            <td style = "text-align: left; width: 25%; font-weight: bold;"> 
                <a href="{{ route('admin::dataall',['keytab'=>1,'id'=>$value["key"]]) }}" title="{{ $value["value"] }}">
                    {{ $value["value"] }}
                </a>
            </td>
            <td style = "text-align: center; width: 25%; font-weight: bold;"> 
                <a href="{{ route('admin::dataall',['keytab'=>1, 'id'=>$value["key"]]) }}" title="{{ $value["value"] }}">
                    {{ $value["brids_eys"] }}
                </a>
            </td>
            <td style = "text-align: center; width: 25%; font-weight: bold;"> 
                <a href="{{ route('admin::dataall',['keytab'=>2, 'id'=>$value["key"]]) }}" title="{{ $value["value"] }}">
                    {{ $value["survey_value"] }}
                </a>
            </td>
            <td style = "text-align: center; width: 25%; font-weight: bold;"> 
                <a href="{{ route('admin::dataall',['keytab'=>3, 'id'=>$value["key"]]) }}" title="{{ $value["value"] }}">
                    {{ $value["exit_value"] }}
                </a>
            </td>            
        </tr>
       @endforeach
    </tbody>
</table>