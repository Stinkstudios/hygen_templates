import { Raycaster, Vector2 } from 'three'
import EventEmitter from '../helpers/eventEmitter'
import Constants from '../constants'

class Interactions extends EventEmitter {
    get defaults() {return {
        trackMouseMove: false, 
        events: [],
        interactiveElements: []
    }}
    constructor(options) {
        super()
        Object.assign(this, Object.assign(this.defaults, options))
        this.raycaster = new Raycaster()
    }
    start() {
       window.addEventListener('mouseup', this.onMouseUp.bind(this)) 
       window.addEventListener('touchstart', this.onTouchStart.bind(this)) 
       if(this.trackMouseMove) window.addEventListener('mousemove', this.onMouseMove.bind(this)) 
    }

    stop() {
       window.removeEventListener('mouseup', this.onMouseUp.bind(this)) 
       window.removeEventListener('mousemove', this.onMouseMove.bind(this)) 
    }

    setCamera(cam) {
        this.camera = cam
    }

    addElement(el) {
        this.interactiveElements.push(el)
    }

    onTouchStart(e) {
        const position = this.getTouchPosition(e)
        const intersects = this.getIntersects(position)
    }

    onMouseUp(e) {
        const position = this.getMousePosition(e)
        const intersects = this.getIntersects(position)
        this.emit(Constants.MOUSE_UP_INTERSECTED, intersects)
    }

    onMouseMove(e) {
        const position = this.getMousePosition(e)
        const intersects = this.getIntersects(position)
        this.emit(Constants.MOUSE_MOVE_INTERSECTED, intersects)
    }

    getMousePosition(e) {
        var clientX = e.clientX;
        var clientY = e.clientY;
        var mouse = new Vector2();
        mouse.x = (clientX / window.innerWidth) * 2 - 1;
        mouse.y = -(clientY / window.innerHeight) * 2 + 1;
        return mouse 
    }

    getTouchPosition(e) {
        const clientX = e.targetTouches[0].clientX;
        const clientY = e.targetTouches[0].clientY;
        var mouse = new Vector2();
        mouse.x = (clientX / window.innerWidth) * 2 - 1;
        mouse.y = -(clientY / window.innerHeight) * 2 + 1;
        return mouse 
    }

    getIntersects(position) {
        this.raycaster.setFromCamera(position, this.camera);
        const intersects = this.raycaster.intersectObjects(
            this.interactiveElements,
            true
        );
        return intersects
    }
}

export default Interactions 