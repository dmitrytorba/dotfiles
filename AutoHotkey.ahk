#Requires AutoHotkey v2.0
Capslock::Ctrl
LCtrl::Alt
LAlt::Ctrl
<^Tab:: {
 Send '{Alt down}{Tab}'
 KeyWait 'Alt'
 Send '`n{Alt up}'
}