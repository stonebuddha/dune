open Import
open Stdune

module Format_dune_lang = Dune.Format_dune_lang

let doc = "Format dune files"

let man =
  [ `S "DESCRIPTION"
  ; `P {|$(b,dune format-dune-file) reads a dune file and outputs a formatted
           version. |}
  ]

let info = Term.info "format-dune-file" ~doc ~man

let term =
  let%map path_opt =
    let docv = "FILE" in
    let doc = "Path to the dune file to parse." in
    Arg.(value & pos 0 (some path) None & info [] ~docv ~doc)
  in
  let input = Option.map ~f:Arg.Path.path path_opt in
  Format_dune_lang.format_file ~input

let command = term, info