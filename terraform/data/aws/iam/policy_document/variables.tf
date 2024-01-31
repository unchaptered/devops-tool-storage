variable "statements" {
  type = list(object({
    sid       = string,
    effect    = string,
    actions   = list(string),
    resources = list(string),
    principals = list(object({
      type        = string,
      identifiers = list(string)
    })),
    condition = list(object({
      test     = string,
      variable = string,
      values   = list(string)
    }))
  }))
}
