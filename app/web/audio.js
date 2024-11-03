async function playSound(audio, volume = 1, loop = false) {
  return new Promise((resolve, reject) => {
    try {
      const myAudio = new Audio(audio)
      myAudio.volume = volume
      myAudio.addEventListener('ended', function() {
        myAudio.currentTime = 0
        console.trace('ended')
        if (loop) {
          // loopの場合は再帰的に再生する(resolve()は呼ばれない)
          myAudio.play().catch((e) => {
            console.error(e)
            return reject(e)
          })
        } else {
          return resolve()
        }
      })
      myAudio.play().catch((e) => {
        console.error(e)
        return reject(e)
      })
    } catch (e) {
      console.error(e)
      return resolve()
    }
  })
}

export function playSoundWithControl(audio, fn) {
  const myAudio = new Audio(audio)
  myAudio.volume = 0.1
  myAudio.addEventListener('ended', () => {
    myAudio.currentTime = 0
    console.trace('ended')
    if (fn) {
      fn(undefined)
    }
  })
  myAudio.play().catch((e) => {
    console.error(e)
    if (fn) {
      fn(e)
    }
  })
  return myAudio
}

class AudioPlayer {
  audio
  constructor(audio) {
    this.audio = new Audio(audio)
  }

  async play() {
    await this.audio.play()
  }

  stop() {
    this.audio.pause()
    this.audio.currentTime = 0
  }

  pause() {
    this.audio.pause()
  }

  addEventListener(type, fn) {
    this.audio.addEventListener(type, () => {
      console.trace(`called ${type}.`)
      fn(undefined)
    })
  }
}
