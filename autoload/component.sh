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

cat << EOM > $1/$1.scss
.$1 {

}
EOM

cat << EOM > $1/index.js
export * from './$1'
EOM
}
