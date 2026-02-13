<script lang="ts">
  import { Canvas } from '@threlte/core'
  import { WebGLRenderer } from 'three'

  import Scene from '@components/Scene.svelte'

  let w = $state(0.01)
</script>

<Canvas
  createRenderer={(canvas) => {
    return new WebGLRenderer({ antialias: true, canvas, stencil: true })
  }}
>
  <Scene {w} />
</Canvas>
