import express from 'express'
import cors from 'cors'
import bodyParser from 'body-parser'

import * as functions from './src'

const app = express()
app.use(cors())
app.use(bodyParser.json())

const port = 4848

for (const fn in functions) {
    app.use(`/functions/${fn}`, (functions as any)[fn as any])
    console.log(fn) //eslint-disable-line
}

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})
