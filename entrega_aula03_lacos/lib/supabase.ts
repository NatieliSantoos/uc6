import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error(
    'Configure VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY no arquivo .env.',
  )
}

// A chave anon é própria para uso no navegador quando RLS está configurada.
// Nunca coloque a chave service_role no front-end.
export const supabase = createClient(supabaseUrl, supabaseAnonKey)

export async function garantirSessaoAnonima() {
  const { data: sessionData, error: sessionError } =
    await supabase.auth.getSession()

  if (sessionError) throw sessionError
  if (sessionData.session) return sessionData.session

  const { data, error } = await supabase.auth.signInAnonymously()
  if (error) throw error
  if (!data.session) throw new Error('Não foi possível iniciar a sessão.')

  return data.session
}
