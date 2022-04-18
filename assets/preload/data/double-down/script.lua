local defaultNotePos = {};
local shake = 4;
function onSongStart()
    for i = 0,7 do
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 300) * (bpm / 170)
    if curStep >= 926 then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
        end
    end
end