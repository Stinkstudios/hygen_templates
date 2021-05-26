import Main from './main'
import { useRef, useEffect } from 'react'

const WebGL = () => {
    const $canvas = useRef()
    const webglContext = useRef()
    useEffect(() => {
        webglContext.current = new Main({
            canvas: $canvas.current
        })
        webglContext.current.init()
    }, [$canvas])
    return (
        <canvas ref={$canvas}/>
    )
}

export default WebGL