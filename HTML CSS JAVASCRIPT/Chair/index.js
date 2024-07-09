

document.addEventListener('DOMContentLoaded', function () {
    
    const radioButtons = document.querySelectorAll('input[name="color-btn"]');
    
    const imageContainer = document.getElementById('imageContainer');

    
    radioButtons.forEach(radio => {
        radio.addEventListener('change', () => {
           
            switch (radio.value) {
                case 'img1':
                    imageContainer.style.backgroundImage = "url('/images/chair1.png')";
                    document.body.style.backgroundImage = 'linear-gradient(196deg, #f1a9a9, #e66767)';
                    break;
                case 'img2':
                    imageContainer.style.backgroundImage = "url('/images/chair2.png')";
                    document.body.style.backgroundImage = 'linear-gradient(196deg, #4c4c4c, #262626)';
                    break;
                case 'img3':
                    imageContainer.style.backgroundImage = "url('/images/chair3.png')";
                    document.body.style.backgroundImage = 'linear-gradient(196deg, #8a9fb2, #5f7991)';
                    break;
                case 'img4':
                    imageContainer.style.backgroundImage = "url('/images/chair4.png')";
                    document.body.style.backgroundImage = 'linear-gradient(196deg, #97afc3, #6789a7)';
                    break;
                case 'img5':
                    imageContainer.style.backgroundImage = "url('/images/chair5.png')";
                    document.body.style.backgroundImage='linear-gradient(196deg, #afa6a0, #8c7f76)';
                    break;
                case 'img6':
                    imageContainer.style.backgroundImage = "url('/images/chair6.png')";
                    document.body.style.backgroundImage = 'linear-gradient(196deg, #aaadac, #838786)';
                    break;
                default:
                    imageContainer.style.backgroundImage = "url('/images/chair1.png')";
                    document.body.style.backgroundColor = 'linear-gradient(196deg, #f1a9a9, #e66767)';
                    break;
            }
        });
    });
});
