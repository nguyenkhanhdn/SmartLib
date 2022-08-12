var message = document.querySelector('#message');

var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;

var grammar = '#JSGF V1.0;'

var recognition = new SpeechRecognition();
var speechRecognitionList = new SpeechGrammarList();
speechRecognitionList.addFromString(grammar, 1);
recognition.grammars = speechRecognitionList;
recognition.lang = 'vi-VN';
recognition.interimResults = true;
recognition.continuous = true;
recognition.start();

recognition.onresult = function (event) {
    var lastResult = event.results.length - 1;
    var content = event.results[lastResult][0].transcript;
    //message.textContent = 'Voice Input: ' + content + '.';
    if (content.includes("tìm kiếm")) {
        window.location.href = "/home/Explorer";
    }
    if (content.includes("tìm sách")) {
        window.location.href = "/home/Explorer";
    }
    if (content.includes("tìm")) {
        window.location.href = "/home/Explorer";
    }
    if (content.includes("tìm kiếm sách")) {
        window.location.href = "/home/Explorer";
    }
};

recognition.onspeechend = function () {
    recognition.stop();
};

recognition.onerror = function (event) {
    message.textContent = 'Error occurred in recognition: ' + event.error;
}

document.querySelector('#btnTalk').addEventListener('click', function () {
    recognition.start();
});