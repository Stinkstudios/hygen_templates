import Environment from './environment'
import Constants from './constants'
import WindowSize from '~/helpers/singletons/windowSize'
import Interactions from './helpers/interactions'

import {Box} from './elements'

class Main {
    get defaults() {return {}}
    constructor(options) {
        Object.assign(this, Object.assign(this.defaults, options))
        this.environment = new Environment(options)
        this.environment.on(Constants.ON_FRAME, this.onFrame.bind(this))
        WindowSize.subscribe(this.environment.setSize.bind(this.environment))
        this.interactions = new Interactions({trackMouseMove: true})
        // console.log(this.interactions)
    }

    init() {
        this.environment.init()
        this.interactions.setCamera(this.environment.camera)
        this.box = new Box()
        this.environment.scene.add(this.box.mesh)
        this.environment.start()
        this.interactions.on(Constants.MOUSE_MOVE_INTERSECTED, (e) => {
            // console.log(e)
        })
        this.interactions.addElement(this.box.mesh)
        this.interactions.start()
    }

    onFrame() {
        this.box.mesh.rotation.y += .01
        this.box.mesh.rotation.x += .01
    }
}

export default Main