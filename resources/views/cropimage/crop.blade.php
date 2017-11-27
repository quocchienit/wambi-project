<style>    
    .cropper-view-box,
    .cropper-face {
      border-radius: 50%;
    }
</style>
<!-- Modal -->
<div class="modal fade" id="modal" role="dialog" aria-labelledby="modalLabel" tabindex="-1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabel">Resize Image</h5>        
      </div>
      <div class="modal-body">
        <div  id = "crop-employee" >			
			<div style="height: 360px;">
			      <img id="image-crop">
			</div>
		</div>
		<div style = "margin-top:5px;">
			<button id="zoomIn" type="button" class="btn btn-info waves-effect waves-light">Zoom Out</button>
			<button id="zoomOut" type="button" class="btn btn-info waves-effect waves-light">Zoom In</button>
		</div>
      </div>
      <div class="modal-footer">
      	<button class="btn btn-primary waves-effect waves-light" type="button" id="btnresult">
				    Result
				</button>				
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>

@section('page-script')
var modal = document.getElementById('myModal');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
@append