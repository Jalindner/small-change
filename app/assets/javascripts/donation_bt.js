function donationClientTokenRequester(){
  $.get('/client_token').done(function(response){
      donationNonceMaker(response);
  });
}

function donationNonceMaker(token){
  console.log("Starting noncemaker!");
  braintree.client.create({authorization: token}, function (clientErr, clientInstance) {
    console.log("Creating the client!");
    if (clientErr) {
      // Handle error in client creation
      console.log("error in client creation!!!!!!");
      return;
    }

    console.log("Setting up hosted fields!");
    braintree.hostedFields.create({
      client: clientInstance,
      fields: {amount:{selector: 'input[name=amount]'}}


    }
      , function (hostedFieldsErr, hostedFieldsInstance) {
        if (hostedFieldsErr) {
        // Handle error in Hosted Fields creation
        console.log("error in Hosted Fields creation!!!!!! Error: " + hostedFieldsErr);
        return;
      }

      // $('#submit-button').removeAttribute('disabled');
      console.log("Setting up the submit button!");
      $('#donation-form').on('submit', function (event) {
        event.preventDefault();
        console.log("Button clicked!");

        hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
          console.log("Tokenizing the form fields into an encrypted payload!");
          if (tokenizeErr) {
            // Handle error in Hosted Fields tokenization
             console.log("error in Hosted Fields tokenization!!!!!!");
            return;
          }

          // Put `payload.nonce` into the `payment-method-nonce` input, and then
          // submit the form. Alternatively, you could send the nonce to your server
          // with AJAX.
          // document.querySelector('input[name="payment-method-nonce"]').value = payload.nonce;
          // $('#braintree-form').submit();

          console.log("payload.nonce is: " + payload.nonce);


          //the following goes to 'payments#generate_transaction'
          $.post('/donations', {
            authenticity_token: window._token,
            'client-nonce': payload.nonce,
            amount: $('#amount').val(),
            charity_id: $('input[name=charity_id]').val()
           }).done(function(response){ $('#transaction-success').html(response) })
        }); //end of payload tokenization and send
    }); //end of submit button handler
  }); //end of hosted fields creation
}); //end of client creation
} // end of nonceMaker
