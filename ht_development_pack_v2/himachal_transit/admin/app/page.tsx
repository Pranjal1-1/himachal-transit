import Link from 'next/link'
import styles from './page.module.css'

export default function Home() {
  return (
    <main className={styles.main}>
      <div className={styles.center}>
        <div className={styles.card}>
          <h1>Himachal Transit Admin</h1>
          <p>Manage buses, routes, stops and assignments.</p>
          <div className={styles.grid}>
            <Link className={styles.cardLink} href="/buses">
              <h2>Buses</h2>
              <p>View and manage the fleet.</p>
            </Link>
            <Link className={styles.cardLink} href="/routes">
              <h2>Routes</h2>
              <p>Edit route details and stops.</p>
            </Link>
            <Link className={styles.cardLink} href="/stops">
              <h2>Stops</h2>
              <p>Manage stop locations and metadata.</p>
            </Link>
            <Link className={styles.cardLink} href="/assignments">
              <h2>Assignments</h2>
              <p>Assign buses and drivers to routes.</p>
            </Link>
          </div>
        </div>
      </div>
    </main>
  )
}
