const { BoxGeometry, MeshNormalMaterial, Mesh } = require("three")

class Box {
    constructor() {
        this.geometry = new BoxGeometry( 1, 1, 1 );
        this.material = new MeshNormalMaterial();
        this.mesh = new Mesh( this.geometry, this.material );
        this.mesh.name = "test box"
    }
}

export default Box