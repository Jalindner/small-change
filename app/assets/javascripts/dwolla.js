function dwollaStuff(){
  $('#dwollabutton').on('click', function(){
    console.log("dwolla'd!");


  //   var transactionData = {
  //     amount: 15.23,
  //     destinationId: 'gordon@dwolla.com',
  //     destinationType: 'Email',
  //     pin: 1234
  //   }

  // $.ajax({
  //   type: "POST",
  //   url: 'https://www.dwolla.com/oauth/rest/transactions/send',
  //   data: transactionData,
  //   contentType: "application/json",
  //   dataType:"json"
  // }).done(function(response){
  //   console.log("success!");
  //   console.log(response)
  // })
  // .fail(function(response){
  //   console.log("failure!");
  //   console.log(response);
  // });


  //   $.ajax({
  //   type: "POST",
  //   url: '/dwolla/request_token',
  //   contentType: "application/json",
  //   dataType:"json"
  // }).done(function(response){ console.log(response) }
  // ).fail(function(response){ console.log(response) });



  }) //end of dwolla button selector
} //end of dwollaStuff function
