import {join} from 'ramda'
import {message} from "../shared/message";

export const main = (req: any, res: any) => {
    const msg = join(' ', message)
    console.log(msg)
    res.send(msg)
}
