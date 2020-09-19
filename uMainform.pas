unit uMainform;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleServer, ComObj, SpeechLib_TLB,
    Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
    TMainform = class(TForm)
        Edit1: TEdit;
        BitBtn1: TBitBtn;
        tbVolume: TTrackBar;
        tbRate: TTrackBar;
        Label1: TLabel;
        Label2: TLabel;
        GroupBox1: TGroupBox;
        comboListaVoci: TListBox;
        Memo1: TMemo;
        procedure BitBtn1Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure comboListaVociClick(Sender: TObject);
    private
        procedure Parla(const s: string);
        function Lingua(s: string): string;
        { Private declarations }
    public
        SavedCW: Word;
        SpVoice: OLEVariant;
    end;

var
    Mainform: TMainform;

const
    SVSFDefault = 0;
    SVSFlagsAsync = 1;
    SVSFPurgeBeforeSpeak = 2;

implementation

{$R *.dfm}

procedure TMainform.BitBtn1Click(Sender: TObject);
begin
    Parla(Edit1.Text);
end;

procedure TMainform.comboListaVociClick(Sender: TObject);
var
    voci: OLEVariant;
    i: Integer;
begin
    voci := SpVoice.GetVoices('', '');
    i := comboListaVoci.ItemIndex;
    Memo1.Clear;
    Memo1.Lines.Add('Nome: ' + voci.Item(i).GetDescription);
    Memo1.Lines.Add('Lingua: ' + voci.Item(i).GetAttribute('Language') + ' ' + Lingua(voci.Item(i).GetAttribute('Language')));
end;

procedure TMainform.FormCreate(Sender: TObject);
var
    voci: OLEVariant;
    i, Y: Integer;
begin
    Memo1.Clear;

    SpVoice := CreateOleObject('SAPI.SpVoice');
    voci := SpVoice.GetVoices('', '');
    Y := -1;
    comboListaVoci.Clear;
    for i := 0 to voci.Count - 1 do
    begin
        comboListaVoci.Items.Add(Lingua(voci.Item(i).GetAttribute('Language')) + ' - ' + voci.Item(i).GetDescription);
        if Lingua(voci.Item(i).GetAttribute('Language')) = 'ITA' then Y := i;//seleziono l'ultima voce italiana
    end;
    comboListaVoci.ItemIndex := Y;
    if comboListaVoci.ItemIndex<>-1 then comboListaVociClick(self);
end;

procedure TMainform.FormDestroy(Sender: TObject);
begin
    SpVoice := Unassigned;
end;

function TMainform.Lingua(s: string): string;
begin
(*
    Afrikaans (South Africa)	=	436
    Albanian (Albania)	=	41C
    Amharic (Ethiopia)	=	45E
    Arabic (Algeria)	=	1401
    Arabic (Bahrain)	=	3C01
    Arabic (Egypt)	=	C01
    Arabic (Iraq)	=	801
    Arabic (Jordan)	=	2C01
    Arabic (Kuwait)	=	3401
    Arabic (Lebanon)	=	3001
    Arabic (Libya)	=	1001
    Arabic (Morocco)	=	1801
    Arabic (Oman)	=	2001
    Arabic (Qatar)	=	4001
    Arabic (Saudi Arabia)	=	401
    Arabic (Syria)	=	2801
    Arabic (Tunisia)	=	1C01
    Arabic (U.A.E.)	=	3801
    Arabic (Yemen)	=	2401
    Armenian (Armenia)	=	42B
    Assamese (India)	=	44D
    Azeri (Cyrillic, Azerbaijan)	=	82C
    Azeri (Latin, Azerbaijan)	=	42C
    Basque (Basque)	=	42D
    Belarusian (Belarus)	=	423
    Bengali (Bangladesh)	=	845
    Bengali (India)	=	445
    Bosnian (Latin, Bosnia and Herzegovina)	=	141A
    Bulgarian (Bulgaria)	=	402
    Catalan (Catalan)	=	403
    Chinese (Simplified, PRC)	=	804
    Chinese (Simplified, Singapore)	=	1004
    Chinese (Traditional, Hong Kong S.A.R.)	=	C04
    Chinese (Traditional, Macao S.A.R.)	=	1404
    Chinese (Traditional, Taiwan)	=	404
    Croatian (Croatia)	=	41A
    Czech (Czech Republic)	=	405
    Danish (Denmark)	=	406
    Divehi (Maldives)	=	465
    Dutch (Belgium)	=	813
    Dutch (Netherlands)	=	413
    English (Australia)	=	C09
    English (Belize)	=	2809
    English (Canada)	=	1009
    English (Caribbean)	=	2409
    English (India)	=	4009
    English (Ireland)	=	1809
    English (Jamaica)	=	2009
    English (New Zealand)	=	1409
    English (Republic of the Philippines)	=	3409
    English (South Africa)	=	1C09
    English (Trinidad and Tobago)	=	2C09
    English (United Kingdom)	=	809
    English (United States)	=	409
    English (Zimbabwe)	=	3009
    Estonian (Estonia)	=	425
    Faroese (Faroe Islands)	=	438
    Filipino (Philippines)	=	464
    Finnish (Finland)	=	40B
    French (Belgium)	=	80C
    French (Canada)	=	C0C
    French (France)	=	40C
    French (Luxembourg)	=	140C
    French (Monaco)	=	180C
    French (Switzerland)	=	100C
    Frisian (Netherlands)	=	462
    Galician (Galician)	=	456
    Georgian (Georgia)	=	437
    German (Austria)	=	C07
    German (Germany)	=	407
    German (Liechtenstein)	=	1407
    German (Luxembourg)	=	1007
    German (Switzerland)	=	807
    Greek (Greece)	=	408
    Gujarati (India)	=	447
    Hebrew (Israel)	=	40D
    Hindi (India)	=	439
    Hungarian (Hungary)	=	40E
    Icelandic (Iceland)	=	40F
    Igbo (Nigeria)	=	470
    Indonesian (Indonesia)	=	421
    Irish (Ireland)	=	83C
    isiXhosa (South Africa)	=	434
    isiZulu (South Africa)	=	435
    Italian (Italy)	=	410
    Italian (Switzerland)	=	810
    Japanese (Japan)	=	411
    Kannada (India)	=	44B
    Kazakh (Kazakhstan)	=	43F
    Khmer (Cambodia)	=	453
    Kiswahili (Kenya)	=	441
    Konkani (India)	=	457
    Korean (Korea)	=	412
    Kyrgyz (Kyrgyzstan)	=	440
    Lao (Lao P.D.R.)	=	454
    Latvian (Latvia)	=	426
    Lithuanian (Lithuania)	=	427
    Macedonian (Former Yugoslav Republic of Macedonia)	=	42F
    Malay (Brunei Darussalam)	=	83E
    Malay (Malaysia)	=	43E
    Malayalam (India)	=	44C
    Maltese (Malta)	=	43A
    Maori (New Zealand)	=	481
    Marathi (India)	=	44E
    Mongolian (Cyrillic, Mongolia)	=	450
    Mongolian (Traditional Mongolian, PRC)	=	850
    Nepali (Nepal)	=	461
    Norwegian, Bokmal (Norway)	=	414
    Norwegian, Nynorsk (Norway)	=	814
    Oriya (India)	=	448
    Persian	=	429
    Polish (Poland)	=	415
    Portuguese (Brazil)	=	416
    Portuguese (Portugal)	=	816
    Punjabi (India)	=	446
    Romanian (Romania)	=	418
    Romansh (Switzerland)	=	417
    Russian (Russia)	=	419
    Sami, Northern (Norway)	=	43B
    Sanskrit (India)	=	44F
    Serbian (Cyrillic, Serbia and Montenegro (Former))	=	C1A
    Serbian (Latin, Serbia and Montenegro (Former))	=	81A
    Setswana (South Africa)	=	432
    Sinhala (Sri Lanka)	=	45B
    Slovak (Slovakia)	=	41B
    Slovenian (Slovenia)	=	424
    Spanish (Argentina)	=	2C0A
    Spanish (Bolivarian Republic of Venezuela)	=	200A
    Spanish (Bolivia)	=	400A
    Spanish (Chile)	=	340A
    Spanish (Colombia)	=	240A
    Spanish (Costa Rica)	=	140A
    Spanish (Dominican Republic)	=	1C0A
    Spanish (Ecuador)	=	300A
    Spanish (El Salvador)	=	440A
    Spanish (Guatemala)	=	100A
    Spanish (Honduras)	=	480A
    Spanish (Mexico)	=	80A
    Spanish (Nicaragua)	=	4C0A
    Spanish (Panama)	=	180A
    Spanish (Paraguay)	=	3C0A
    Spanish (Peru)	=	280A
    Spanish (Puerto Rico)	=	500A
    Spanish (Spain, International Sort)	=	C0A
    Spanish (Spain, Traditional Sort)	=	40A
    Spanish (Uruguay)	=	380A
    Swedish (Finland)	=	81D
    Swedish (Sweden)	=	41D
    Syriac (Syria)	=	45A
    Tajik (Cyrillic, Tajikistan)	=	428
    Tamil (India)	=	449
    Tatar (Russia)	=	444
    Telugu (India)	=	44A
    Thai (Thailand)	=	41E
    Tibetan (PRC)	=	451
    Turkish (Turkey)	=	41F
    Turkmen (Turkmenistan)	=	442
    Ukrainian (Ukraine)	=	422
    Upper Sorbian (Germany)	=	42E
    Urdu (Islamic Republic of Pakistan)	=	420
    Uzbek (Cyrillic, Uzbekistan)	=	843
    Uzbek (Latin, Uzbekistan)	=	443
    Vietnamese (Vietnam)	=	42A
    Welsh (United Kingdom)	=	452

*)
    result := s;
    if s = '410' then
        result := 'ITA';
    if s = '409' then
        result := 'USA';
    if s = '809' then
        result := 'UK ';
    if s = 'c0a' then
        result := 'SPA';
    if s = '40C' then
        result := 'FRA';
    if s = '40C' then
        result := 'FRA';
end;

procedure TMainform.Parla(const s: string);
begin
    SpVoice.Voice := SpVoice.GetVoices.Item(comboListaVoci.ItemIndex);
    SavedCW := Get8087CW;
    Set8087CW(SavedCW or $4);
    SpVoice.volume := tbVolume.position;
    SpVoice.rate := tbRate.position;
    SpVoice.Speak(s, SVSFlagsAsync or SVSFPurgeBeforeSpeak);
    Set8087CW(SavedCW);
end;

end.
