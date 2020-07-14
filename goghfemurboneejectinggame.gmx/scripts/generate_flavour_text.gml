// Haha bacomn,,machine ...gGO!!!!!!=
/// Generates & returns flavour text
var _wordsnum = irandom_range(1, 3);

// Generate beginning part
var _text = "";
_text += oGamevars.tblFlavourTextBegin[@ irandom_range(0, array_length_1d(oGamevars.tblFlavourTextBegin) - 1)];
if (_text != "")
    _text += " ";

// Generate words part
repeat (_wordsnum)
{
    _text += " " + oGamevars.tblFlavourTextWords[@ irandom_range(0, array_length_1d(oGamevars.tblFlavourTextWords) - 1)];
}
// _text += oGamevars.tblFlavourTextVerb[@ irandom_range(0, array_length_1d(oGamevars.tblFlavourTextVerb) - 1)] + " ";
// _text += oGamevars.tblFlavourTextPrefix[@ irandom_range(0, array_length_1d(oGamevars.tblFlavourTextPrefix) - 1)] + " ";
// _text += oGamevars.tblFlavourTextNoun[@ irandom_range(0, array_length_1d(oGamevars.tblFlavourTextNoun) - 1)];
return _text;
