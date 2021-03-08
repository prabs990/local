import { LightningElement } from 'lwc';

export default class Selfie01 extends LightningElement {

    connectedCallback(){
        console.log('inside connectedCallback===');
        this.initializeSettings();
    }
    initializeSettings(){
        console.log('inside initializeSettings===');
        var video = document.getElementById('video');
        // Get access to the camera!
        if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            // Not adding `{ audio: true }` since we only want video now
            navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
                //video.src = window.URL.createObjectURL(stream);
                video.srcObject = stream;
                video.play();
            });
        }else{
            console.log('no broser support');
        }
    }
}