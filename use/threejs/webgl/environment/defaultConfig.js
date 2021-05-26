import { 
    LinearToneMapping, 
    PCFSoftShadowMap, 
    sRGBEncoding
} from 'three'

import Constants from './constants'
const Defaults = {
    paused: true,
    camera: null,
    cameraConfig: {
        fov: 50,
        near: 0.1,
        far: 1500,
        aspect: 2/1,
        origin: [0,2,10]
    },
    renderer: null,
    rendererConfig: {
        canvas: null,
        antialias: true,
        pixelRatio: 2,
        width: null,
        height: null,
        shadowMap: {
            enabled: false,
            type: PCFSoftShadowMap,
            autoUpdate: false
        },
        physicallyCorrectLights: false,
        outputEncoding: sRGBEncoding,
        toneMapping: LinearToneMapping,
        toneMappingExposure: 1.0
    },
    scene: null,
    sceneConfig: {
        background: 0x111111
    },
    events: Object.fromEntries(Object.keys(Constants.events).map(key => [key, {listeners:[]}])),
    strictEvents: true
}

export default Defaults