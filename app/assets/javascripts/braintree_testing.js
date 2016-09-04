$(document).ready(function(){
  clientTokenRequester();
});

function clientTokenRequester(){
  $.get('/client_token').done(function(response){
      nonceMaker(response);
  });
}

function nonceMaker(token){
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
      }

    }, function (hostedFieldsErr, hostedFieldsInstance) {
        if (hostedFieldsErr) {
        // Handle error in Hosted Fields creation
        console.log("error in Hosted Fields creation!!!!!!");
        return;
      }

      // $('#submit-button').removeAttribute('disabled');
      console.log("Setting up the submit button!")
      $('#braintree-form').on('submit', function (event) {
        event.preventDefault();
        console.log("Button clicked!")

        hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
          console.log("Tokenizing the form fields into an encrypted payload!")
          if (tokenizeErr) {
            // Handle error in Hosted Fields tokenization
             console.log("error in Hosted Fields tokenization!!!!!!");
            return;
          }

          // Put `payload.nonce` into the `payment-method-nonce` input, and then
          // submit the form. Alternatively, you could send the nonce to your server
          // with AJAX.

          console.log("payload.nonce is: " + payload.nonce)
          // document.querySelector('input[name="payment-method-nonce"]').value = payload.nonce;
          // $('#braintree-form').submit();

          //the following goes to 'payments#generate_transaction'
          $.post('/transaction-endpoint', { authenticity_token: window._token, 'client-nonce': payload.nonce} )
        }); //end of payload tokenization
    }); //end of submit button handler
  }); //end of hosted fields creation
}); //end of client creation
} // end of nonceMaker
