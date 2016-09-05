$(document).ready(function(){
  if (window.location.pathname == '/grants/new') {
    console.log("On the new grant page!")
    grantClientTokenRequester();
  }
  else if (window.location.pathname == '/submissions/review') {
    console.log("On the submissions review page!")
    paymentClientTokenRequester();
  }
});

function grantClientTokenRequester(){
  $.get('/client_token').done(function(response){
      grantNonceMaker(response);
  });
}

function grantNonceMaker(token){
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
      styles: {
        'input': {
          'font-size': '14pt'
        },
        'input.invalid': {
          'color': 'red'
        },
        'input.valid': {
          'color': 'green'
        }
      },
      fields: {
        number: {
          selector: '#card-number',
          placeholder: '4111 1111 1111 1111'
        },
        cvv: {
          selector: '#cvv',
          placeholder: '123'
        },
        expirationDate: {
          selector: '#expiration-date',
          placeholder: '10 / 2019'
        }
        // ,
        // amount: {
        //   selector: '#amount',
        //   placeholder: '$$$$'
        // }
      }

    }, function (hostedFieldsErr, hostedFieldsInstance) {
        if (hostedFieldsErr) {
        // Handle error in Hosted Fields creation
        console.log("error in Hosted Fields creation!!!!!! Error: " + hostedFieldsErr);
        return;
      }

      // $('#submit-button').removeAttribute('disabled');
      console.log("Setting up the submit button!");
      $('#grant-form').on('submit', function (event) {
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
          $.post('/grants', {
            authenticity_token: window._token,
            'client-nonce': payload.nonce,
            amount: $('#amount').val(),
            sponsor_id: $('#sponsor-info').attr('sponsorid')
           }).done(function(response){ $('#transaction-success').html(response) })
        }); //end of payload tokenization and send
    }); //end of submit button handler
  }); //end of hosted fields creation
}); //end of client creation
} // end of nonceMaker
