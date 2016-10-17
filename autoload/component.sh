component () {
  mkdir $1
cat << EOM > $1/$1.js
import React from 'react'
import styles from './$1.scss'

export const $1 = () => (
  <div className={styles.$1}>
  </div>
)
EOM

cat << EOM > $1/$1.test.js
/* eslint-env mocha */
import {expect} from 'chai'
import React from 'react'
import {shallow} from 'enzyme'
import {$1} from './$1'

describe('<$1 />', () => {
  it('needs tests', () => {
    const wrapper = shallow(<$1 />)
    throw 'needs tests'
  })
})
EOM

cat << EOM > $1/$1.scss
.$1 {

}
EOM

cat << EOM > $1/index.js
export * from './$1'
EOM
}
