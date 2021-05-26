
class EventEmitter {
    on(event, listener) {
        if (!this.events[event]) { 
            if(this.strictEvents) return console.error(`A WEBGL EVENT FOR: ${event} DOES NOT EXIST AND WEBGL STRICT EVENT MODE IS TURNED ON.`)
            this.events[event] = { listeners: [] } 
        }
        this.events[event].listeners.push(listener);
    }
    off(event) {
        delete this.events[event]
    }
    emit(name, ...payload) {
        for (const listener of this.events[name].listeners) {
            listener.apply(this, payload)
        }
    }
}

export default EventEmitter