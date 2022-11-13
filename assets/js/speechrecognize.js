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

    //var keyword1 = content.toLowerCase();
    var keyword2 = content.toLowerCase();
    //alert(keyword2);
    //debugger;
    if (keyword2 == 'tìm' || keyword2 == 'tìm kiếm' || keyword2 == 'tìm sách' || keyword2 == 'tìm kiếm sách') {
        var final_url = "/home/Explorer";
        window.location.href = final_url;
    } else {
        var final_url = "/home/VoiceSearch?title=" + keyword2;
        window.location.href = final_url;
    }    
};

recognition.onspeechend = function () {
    recognition.stop();
};

recognition.onerror = function (event) {
    var msg = 'Error occurred in recognition: ' + event.error;
    console.log(msg);
}
