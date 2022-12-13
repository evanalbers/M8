# Welcome to Sonic Pi
tempo = 60
use_synth :piano
gmaj = chord(:g3, :major)

#this is the baseline thread
in_thread do
  loop do
    use_bpm tempo
    3.times do
      sample :drum_heavy_kick
      sleep(0.75)
      sample :drum_heavy_kick
      sleep(0.25)
      sample :drum_snare_soft
      sleep(1)
      sample :drum_heavy_kick
      sleep(1)
      sample :drum_snare_soft
      sleep(1)
    end
    
    sample :drum_heavy_kick
    sleep(0.5)
    sample :drum_snare_soft
    sleep(0.5)
    sample :drum_snare_soft
    sleep(0.5)
    sample :drum_snare_soft
    sleep(0.5)
  end
end

#these are the soft chords, getting at a hug sort of
in_thread do
  loop do
    use_bpm tempo-30
    play :D3, attack: 0.07, release: 1
    sleep(1)
    play chord(:g3, :major), attack: 0.1, release: 1
    sleep(1)
    play :B2
    sleep(1)
    play chord(:g3, :major), attack: 0.1, release: 1
    sleep(1)
    play :D3
    sleep(1)
    play invert_chord(gmaj, 2), attack: 0.1, release: 1
    sleep(1)
    play :G2
    sleep(1)
    play invert_chord(gmaj, 2), attack: 0.1, release: 1
    sleep(1)
  end
end

#this is the intermittent, calming ethereal ring
in_thread do
  loop do
    use_synth :beep
    with_fx :reverb, room: 0.5 do
      sleep(12)
      play :G5, attack: 0.1, release: 10, amp: 0.1
      sleep(12)
      play :Fs5, attack: 0.1, release: 10, amp: 0.1
      sleep(12)
      play :G5, attack: 0.1, release: 10, amp: 0.1
      sleep(12)
      play :D6, attack: 0.1, release: 10, amp: 0.1
      sleep(12)
      play :G6, attack: 0.1, release: 10, amp: 0.1
      sleep(12)
      
    end
  end
end

#this is the body melody, capturing tiptoing, almost
in_thread do
  loop do
    use_bpm tempo
    use_synth :piano
    play :G5
    sleep(0.25)
    play :Fs5
    sleep(0.25)
    play :G5
    sleep(0.25)
    play :Fs5
    sleep(0.25)
    play :G5
    sleep(0.5)
    play :D6
    sleep(0.5)
    play :G6
    sleep(0.25)
    play :Fs6
    sleep(0.25)
    play :G6
    sleep(0.25)
    play :Fs6
    sleep(0.25)
    play :D6
    sleep(0.5)
    play :B5
    sleep(0.5)
    sleep(10)
    with_fx :reverb, room: 0.5 do #reverb gives a nice ring
      play :D5
      sleep(1)
      play :E5
      sleep(1)
      play :Fs5
      sleep(1)
      play :G5
      sleep(1)
      play :Fs5
      sleep(1)
      play :D5
      sleep(1)
      play :E5
      sleep(1)
      play :Fs5
      sleep(1)
      play :B5
      sleep(1)
      play :Fs5
      sleep(1)
      play :E5
      sleep(1)
      sleep(10)
    end
  end
end
