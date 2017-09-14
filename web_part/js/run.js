// ini array current parameter values
window.param_set = [];

function create_slider(id, values) {

  // Add new HTML
  // --------------------------------------------
  $('#sliders_tbl').append(
    "\n <tr> \
          <td>"+id+"</td> \
          <td> <div id='param_"+id+"' class='slider'></div>  </td>\
          <td id=val_param_"+id+">"+values[0]+"</td>\
        </tr>"
  );

  // initialize JS
  // ---------------------------------------------
  // Recording Default  Selected Value
  window.param_set[id] = values[0];

  // Initializing slider
  $("#param_"+id).slider({
      min: 0,
      max: values.length - 1,
      value: 0,
      slide: function(event, ui) {
          // $("#amount").val();
          $('#val_param_'+id).html(
              values[ui.value]
          );
          window.param_set[id]=values[ui.value];
          update_img();
      }
  });

}

// ---------------------------------------------------------------------

function generate_img_name(name, paramObj) {
  // name - the name of the plot
  // paramObj - parameter names and value arrays object
  // paramValues - specific values of all parameters (vector - not matrix)
  img_name = name;

  n = 0; // not nice but works
  for (var p in paramObj) {
    img_name = img_name +'_'+ p + '='+window.param_set[p];
    n++;
  }
  return img_name+'.png';
}

function update_img() {
  img_name = generate_img_name(
                          window.plot_name,
                          window.param,
             );
  $("img#the_img").attr(
    {"src" : "img/"+img_name}
  );
  return img_name;

}

// ------------- Loading JSON data ----------------------
data = jQuery.parseJSON( json_string );
window.param = data.parameters;
window.plot_name = data.plot_name;
