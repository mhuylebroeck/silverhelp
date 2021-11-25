import places from 'places.js';

const initAutocomplete = () => {
  console.log("Initi autocomplete")
  const addressInput = document.querySelector('.location-autocomplete');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
