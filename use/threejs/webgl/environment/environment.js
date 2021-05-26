import Constants from '../constants'
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
        this.emit(Constants.ON_FRAME)
        this.renderer.render(this.scene, this.camera);
        window.requestAnimationFrame(this.onFrame.bind(this))
    }

    setSize(obj) {
        this.camera.aspect = obj.width / obj.height;
        this.camera.updateProjectionMatrix();
        this.renderer.setSize(obj.width, obj.height)
    }

    destroy() {
        this.emit(Constants.DESTROY)
        //NOTE: cleanup everything in the environment
    }
}

export default Environment