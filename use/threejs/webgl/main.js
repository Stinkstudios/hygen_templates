import Environment from './environment'

import {Box} from './elements'
import Constants from './environment/constants'
import { defaultOptions } from 'yaml'

class Main {
    get defaults() {return {key:'value'}}
    constructor(options) {
        Object.assign(this, Object.assign(this.defaults, options))
        this.environment = new Environment(options)
        this.environment.on(Constants.events.ON_FRAME, this.onFrame.bind(this))
    }

    init() {
        this.environment.init()
        this.box = new Box()
        this.environment.scene.add(this.box.mesh)
        this.environment.start()
    }

    onFrame() {
        this.box.mesh.rotation.y += .01
        this.box.mesh.rotation.x += .01
    }
}

export default Main