"use strict"
const fs = require("fs")
const shuffle = (array) => {
  let out = []
  while (array.length) {
    const index = Math.floor(Math.random() * array.length)
    out.push(array.splice(index, 1)[0])
  }
  return out
}

fs.readFile("2015-Day-9.1_Input_Bsp.txt", "utf8", (err, data) => {
  const lines = data.split("\n")
  const routes = lines.reduce((mem, line) => {
    const [path, dist] = line.split(" = ")
    const [from, to] = path.split(" to ")
    mem[from] = mem[from] || {}
    mem[to] = mem[to] || {}

    mem[from][to] = parseInt(dist)
    mem[to][from] = parseInt(dist)

    return mem
  }, {})

  let locs = Object.keys(routes)
  let max = false

  for (let i = 0; i < 1000000; i++) {
    locs = shuffle(locs)

    let len = 0
    for (let l = 0; l < (locs.length - 1); l++) {
      const from = locs[l]
      const to = locs[l+1]

      len += routes[from][to]
    }

    max = Math.max(max, len) || len
    console.log(i, max)
  }

  console.log(max)
})