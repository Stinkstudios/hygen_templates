import { 
    Color,
    PerspectiveCamera, 
    Scene, 
    WebGLRenderer 
} from 'three'

import EventEmitter from '../helpers/eventEmitter'
import Defaults from './defaultConfig'

class BaseWebGl extends EventEmitter {
    get defaults() {return Defaults}

    constructor(options) {
        super()
        if(!options.canvas) console.error('MUST PROVIDE CANVAS ELEMENT AS canvas PROP IN CONSTRUCTOR')
        options.rendererConfig = {canvas: options.canvas}
        delete options.canvas
        Object.assign(this, Object.assign(this.defaults, options))
    }
    init() {
        this.renderer = this.setupRenderer()
        this.camera = this.setupCamera()
        this.scene = this.setupScene()
    }

    setupRenderer() { 
        this.rendererConfig.width = window.innerWidth
        this.rendererConfig.height = window.innerHeight;
        const renderer = new WebGLRenderer({ canvas: this.rendererConfig.canvas, antialias: this.rendererConfig.antialias})
              renderer.setSize(this.rendererConfig.width, this.rendererConfig.height)
              renderer.setPixelRatio(this.rendererConfig.pixelRatio)
        return renderer
    }

    setupCamera() {
        this.cameraConfig.aspect = window.innerWidth / window.innerHeight;
        const camera = new PerspectiveCamera(
            this.cameraConfig.fov, 
            this.cameraConfig.aspect, 
            this.cameraConfig.near, 
            this.cameraConfig.far
        );
        camera.position.set(...this.cameraConfig.origin);
        camera.updateProjectionMatrix();
        return camera
    }

    setupScene() {
        const scene = new Scene()
        scene.background = new Color(this.sceneConfig.background)
        return scene
    }
}

export default BaseWebGl