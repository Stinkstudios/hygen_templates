import Constants from './constants'
import BaseWebGl from './base'

class Environment extends BaseWebGl {
    
    constructor(options) {
        super(options)
    }

    start() {
        this.paused = false
        window.requestAnimationFrame(this.onFrame.bind(this))
    }

    pause() {
        this.paused = true
    }

    onFrame() {
        if(this.paused) return
        this.emit(Constants.events.ON_FRAME)
        this.renderer.render(this.scene, this.camera);
        window.requestAnimationFrame(this.onFrame.bind(this))
    }

    destroy() {
        this.emit(Constants.events.DESTROY)
        //NOTE: cleanup everything in the environment
    }
}

export default Environment