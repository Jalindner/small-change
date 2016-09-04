$(document).ready(function(){

  clientTokenRequester();


  // ;

});


function clientTokenRequester(){
  $.get('/client_token').done(function(response){
      nonceMaker(response);
  });



 // $('#braintree-form').on('submit', function(event){
 //    event.preventDefault();

 //  });
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

          $.post('/transaction-endpoint', { authenticity_token: window._token, 'client-nonce': payload.nonce} )
        });
    });
  // console.log('ready to submit the form!')
  });
});
}

// function nonceMaker(){
//   braintree.client.create({
//     // Replace this with your own authorization.
//     authorization: "fkdaljfkl"  //change this to client token
//   }, function (clientErr, clientInstance) {
//     // if (clientErr) {
//     //   // Handle error in client creation
//     //   console.log("error in client creation!!!!!!")
//     //   return;
//     // }

//     braintree.hostedFields.create({
//       // client: clientInstance,
//       // styles: {
//       //   'input': {
//       //     'font-size': '14pt'
//       //   },
//       //   'input.invalid': {
//       //     'color': 'red'
//       //   },
//       //   'input.valid': {
//       //     'color': 'green'
//       //   }
//       // },
//       // fields: {
//       //   number: {
//       //     selector: '#card-number',
//       //     placeholder: '4111 1111 1111 1111'
//       //   },
//       //   cvv: {
//       //     selector: '#cvv',
//       //     placeholder: '123'
//       //   },
//       //   expirationDate: {
//       //     selector: '#expiration-date',
//       //     placeholder: '10 / 2019'
//       //   }
//       // }
//     }, function (hostedFieldsErr, hostedFieldsInstance) {
//       // if (hostedFieldsErr) {
//       //   // Handle error in Hosted Fields creation
//       //   console.log("error in Hosted Fields creation!!!!!!")
//       //   return;
//       // }

//       // submit.removeAttribute('disabled');

//       // $('#braintree-form').on('submit', function (event) {
//       //   event.preventDefault();

//       //   hostedFieldsInstance.tokenize(function (tokenizeErr, payload) {
//       //     if (tokenizeErr) {
//       //       // Handle error in Hosted Fields tokenization
//       //        console.log("error in Hosted Fields tokenization!!!!!!")
//       //       return;
//       //     }

//       //     // Put `payload.nonce` into the `payment-method-nonce` input, and then
//       //     // submit the form. Alternatively, you could send the nonce to your server
//       //     // with AJAX.

//       //     document.querySelector('input[name="payment-method-nonce"]').value = payload.nonce;
//       //     form.submit();
//       //   });
//       // }, false);
//     });
//   });
// };
