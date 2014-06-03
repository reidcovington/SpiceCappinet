$(document).ready(function () {
  // send an HTTP DELETE request for the sign-out link
  $('#sign-out').on("click", function (e) {
    e.preventDefault();
    alert("signing-out");
    var request = $.ajax({
      url: '/sessions/end',
      type: 'delete'
    });
    request.done(function () { window.location = "/";
    });
    request.fail(function() {
      alert("sign-out failed");
    });
  });

  // // send an HTTP DELETE request for the delete organization link
  // $('#delete').on("click", function (e) {
  //   e.preventDefault();
  //   alert("deleting-organization");
  //   var url = $(this).attr('href');
  //   // console.log(url);
  //   var request = $.ajax({
  //     url: url,
  //     type: 'delete'
  //   });
  //   request.done(function () { window.location = "/";
  //   });
  //   request.fail(function() {
  //     alert("delete-organization failed");
  //   });
  // });

  // // load new_organization from server and place the returned HTML into content
  // $('#new').on("click", function (e) {
  //   e.preventDefault();
  //   $('#content').load('/organization/new #new-details',function(){
  //     // send an HTTP POST request with JSON containing new organization data for the log organization button
  //     $('#log-organization').on("click", function (e) {
  //       e.preventDefault();
  //       alert("logging-organization");
  //       var organizationName = $('#organization_name').val();
  //       var organizationDescription = $('#organization_description').val();
  //       var organizationStudents = $('#organization_students').val();
  //       var data = {organization_name: organizationName, organization_description: organizationDescription, organization_students: organizationStudents};
  //       $.ajax({
  //         url: '/organization/new',
  //         type: 'post',
  //         data: data
  //       }).done(function () { window.location = "/";
  //       }).fail(function() {
  //         alert("new-organization failed");
  //       });
  //     });
  //   });
  // });

  // $('#new-user').on("click", function (e) {
  //   e.preventDefault();
  //   $('#content').load('/organization/new #new-details',function(){
  //     // send an HTTP POST request with JSON containing new organization data for the log organization button
  //     $('#log-organization').on("click", function (e) {
  //       e.preventDefault();
  //       alert("logging-organization");
  //       var destinationName = $('#destination_name').val();
  //       var tripDuration = $('#trip_duration').val();
  //       var tripCompleted = $('#trip_completed').val();
  //       var data = {destination_name: destinationName, trip_duration: tripDuration, trip_completed: tripCompleted};
  //       $.ajax({
  //         url: '/organization/new',
  //         type: 'post',
  //         data: data
  //       }).done(function () { window.location = "/";
  //       }).fail(function() {
  //         alert("new-organization failed");
  //       });
  //     });
  //   });
  // });


});









