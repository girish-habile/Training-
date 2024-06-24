function showError(inputId, errorMessage) {
    hideError(inputId);
    const errorContainer = document.querySelector(`#${inputId}Error`);
    errorContainer.textContent = errorMessage;
    errorContainer.style.display = "block";
    console.log('showErro user => ', errorContainer)
}
function hideError(inputId) {
    const errorContainer = document.querySelector(`#${inputId}Error`);
    console.log('showErro user => ', errorContainer, inputId)
    errorContainer.textContent = "";
    errorContainer.style.display = "none";
}

// let formData = {
//     username: document.getElementById("username").value,
//     email: document.getElementById("email").value,
//     password: document.getElementById("password").value,
//     dob: document.getElementById("dob").value,
//     phone: document.getElementById("phone").value,
//     street: document.getElementById("street").value,
//     city: document.getElementById("city").value,
//     state: document.getElementById("state").value,
//     zip: document.getElementById("zip").value
// };

function fillFormAgainUsingTempData(dataObj) {

   
  


        document.getElementById("username").value = localStorage.getItem('temp_username');
   

  
        document.getElementById('email').value = localStorage.getItem('temp_Email');

 
        document.getElementById('password').value = localStorage.getItem('temp_Password')
    

        document.getElementById('password').value = localStorage.getItem('temp_confirmPassWord')
    
  
        document.getElementById('dob').value = localStorage.getItem('temp_dob');
    

        document.getElementById('phone').value = localStorage.getItem('temp_phone')
    
    
        document.getElementById('street').value = localStorage.getItem('temp_street')
  
        document.getElementById('city').value = localStorage.getItem('temp_city')
    
   
        document.getElementById('zip').value = localStorage.getItem('temp_zip')

    
    

}




document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('registrationForm');
    let formData = {
        username: document.getElementById("username").value,
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        dob: document.getElementById("dob").value,
        phone: document.getElementById("phone").value,
        street: document.getElementById("street").value,
        city: document.getElementById("city").value,
        state: document.getElementById("state").value,
        zip: document.getElementById("zip").value
    };
    fillFormAgainUsingTempData(formData);

    form.addEventListener('submit', function (event) {
        event.preventDefault();
        if (validateForm()) {
            alert('Form submitted successfully!');
            let formdata = {
                username: document.getElementById("username").value,
                email: document.getElementById("email").value,
                password: document.getElementById("password").value,
                dob: document.getElementById("dob").value,
                phone: document.getElementById("phone").value,
                street: document.getElementById("street").value,
                city: document.getElementById("city").value,
                state: document.getElementById("state").value,
                zip: document.getElementById("zip").value
            };

            
            localStorage.setItem('userInfo', JSON.stringify(formdata));
            console.table("saved userInfo", FormData);
            form.reset();
        }
    });

    document.getElementById('username').addEventListener('blur', validateUsername);
    document.getElementById('email').addEventListener('blur', validateEmail);
    document.getElementById('password').addEventListener('blur', validatePassword);
    document.getElementById('confirmPassword').addEventListener('input', validateConfirmPassword);
    document.getElementById('dob').addEventListener('blur', validateDOB);
    document.getElementById('phone').addEventListener('blur', validatePhone);
    document.getElementById('street').addEventListener('blur', validateStreet);
    document.getElementById('city').addEventListener('blur', validateCity);
    document.getElementById('state').addEventListener('blur', validateState);
    document.getElementById('zip').addEventListener('blur', validateZip);
});

function validateForm() {
    return (
        validateUsername() &&
        validateEmail() &&
        validatePassword() &&
        validateConfirmPassword() &&
        validateDOB() &&
        validatePhone() &&
        validateStreet() &&
        validateCity() &&
        validateState() &&
        validateZip()
    );
}

function validateUsername() {
    const username = document.getElementById('username').value.trim();
    // console.log('username :', username);
    const usernameError = document.getElementById('usernameError');
    // console.log('usernameError :', usernameError);
    if (username.length == 0) {
        usernameError.textContent = 'Please enter  username';
        return false;
    }
    else if (!isValidUsername(username)) {
        usernameError.textContent = 'Username must not be start with number .';
        return false;
    }

    else if (username.length < 5 || username.length > 15) {
        usernameError.textContent = 'Username must be between 5 and 15 characters.';
        return false;
    }
    usernameError.textContent = '';
    localStorage.setItem('temp_username',username)
    return true;
}

function isValidUsername(username) {
    let char = username.charAt(0);

    let cond = (char >= 'a' && char <= 'z') || (char >= 'A' && char <= 'Z')
    if (!cond) {
        return false;
    }

    return true;
}



function validateEmail() {
    const email = document.getElementById('email').value;
    const emailError = document.getElementById('emailError');
    if (email.length == 0) {
        emailError.textContent = 'Please enter  email address.';
        return false;
    }
    else if (!/^\S+@\S+.\S+$/.test(email)) {
        emailError.textContent = 'Please enter a valid email address.';
        return false;
    } else {

        emailError.textContent = '';
        localStorage.setItem('temp_Email',email)
        return true;
    }
}



function validatePassword() {
    const password = document.getElementById('password').value;





    let hasUpperCase = false;
    let hasLowerCase = false;
    let hasNumber = false;
    let hasSpecialChar = false;
    const specialCharacters = "!@#$%^&*()_-+=<>?";

    for (let i = 0; i < password.length; i++) {
        const ch = password.charAt(i);

        if ('a' <= ch && ch <= 'z') {
            hasLowerCase = true;
        } else if ('A' <= ch && ch <= 'Z') {
            hasUpperCase = true;
        } else if ('0' <= ch && ch <= '9') {
            hasNumber = true;
        } else if (specialCharacters.includes(ch)) {
            hasSpecialChar = true;
        } else {
            showError('password', `${ch} is not allowed in the password.`);


            return false;
        }
    }


    if (password.length === 0) {
        showError('password', 'Please enter your password');

        return false;
    }
    if (password.length < 8) {
        showError('password', 'Password must be of at least 8 characters');

        return false;
    }
    if (!hasUpperCase) {

        showError('password', 'Password must contain UpperCase');

        return false;
    }
    if (!hasLowerCase) {
        showError('password', 'Password must contain lowerCase ');

        return false;

    }
    if (!hasNumber) {
        showError('password', 'Password must contain number');

        return false;
    }
    else if (!hasSpecialChar) {
        showError('password', 'Password must contain Special Character');
        return false;

    }

    hideError('password')

    localStorage.setItem('temp_Password',password)
    return true;

}





function validateConfirmPassword() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const confirmPasswordError = document.getElementById('confirmPasswordError');

    if (confirmPassword !== password) {
        confirmPasswordError.textContent = 'Passwords do not match.';
        return false;
    }

    confirmPasswordError.textContent = '';
    return true;
}



function validateDOB() {
    const dob = new Date(document.getElementById('dob').value);
    const dobError = document.getElementById('dobError');
    const currentDate = new Date();
    const age = currentDate.getFullYear() - dob.getFullYear();

    if (currentDate.getMonth() < dob.getMonth() || (currentDate.getMonth() === dob.getMonth() && currentDate.getDate() < dob.getDate())) {
        age--;
    }

    if (age < 18) {
        dobError.textContent = 'You must be at least 18 years old.';
        return false;
    }

    dobError.textContent = '';
    localStorage.setItem('temp_dob',dob)
    return true;
}

function validatePhone() {
    const phone = document.getElementById('phone').value.trim();
    const phoneError = document.getElementById('phoneError');
    if (phone.length == 0) {
        phoneError.textContent = 'Please enter your phone number.';
        return false;
    }
    else if (!isValidPhoneNumberFormat(phone)) {
        phoneError.textContent = 'Please enter a valid phone number.';
        return false;
    }

    phoneError.textContent = '';
    localStorage.setItem('temp_phone',phone)
    return true;
}

function isValidPhoneNumberFormat(phone) {
    const strippedPhone = phone.replace(/[^\d]/g, '');
    return strippedPhone.length === 10;
}


function validateStreet() {
    const street = document.getElementById('street').value;
    const streetError = document.getElementById('streetError');
    if (street.trim() === '') {
        streetError.textContent = 'Street cannot be empty.';
        return false;
    } else {
        streetError.textContent = '';
        localStorage.setItem('temp_Street',street)
        return true;
    }
}
function validateCity() {
    const city = document.getElementById('city').value;
    const cityError = document.getElementById('cityError');
    if (city.trim() === '') {
        cityError.textContent = 'City cannot be empty.';
        return false;
    } else {
        cityError.textContent = '';
        localStorage.setItem('temp_City',city)
        return true;
    }
}




function validateState() {
    const state = document.getElementById('state').value;
    const stateError = document.getElementById('stateError');
    if (state.length == 0) {
        stateError.textContent = 'Please enter your state ';
        return false;
    }
    else if (!/^[A-Z]{2}$/.test(state)) {
        stateError.textContent = 'State must be 2 letter capital abbreviation';
        return false;
    } else {
        stateError.textContent = '';
        localStorage.setItem('temp_State',state)
        return true;
    }
}



function validateZip() {
    const zip = document.getElementById('zip').value.trim();
    const zipError = document.getElementById('zipError');
    if (zip.length == 0) {
        zipError.textContent = 'Please enter your  ZIP code.';
        return false;
    }
    else if (!isValidZipFormat(zip)) {
        zipError.textContent = 'Please enter a valid ZIP code.';
        return false;
    }

    zipError.textContent = '';
    localStorage.setItem('temp_Zip',zip)
    return true;
}

function isValidZipFormat(zip) {
    return /^\d{5}(-\d{4})?$/.test(zip);
}

