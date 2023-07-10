resource "aws_cloudwatch_dashboard" "s2s_vpn_dashboard" {
  dashboard_name = "S2S VPN Tunnel Dashboard"
  dashboard_body = <<EOF
    {
      "widgets": [
        {
          "type": "text",
          "x": 0,
          "y": 0,
          "width": 24,
          "height": 1,
          "properties": {
            "markdown": "## S2S VPN Tunnel Status"
          }
        },
        {
          "type": "metric",
          "x": 0,
          "y": 1,
          "width": 12,
          "height": 8,
          "properties": {
            "view": "timeSeries",
            "stacked": false,
            "metrics": [
              [ "AWS/VPN", "TunnelState", "VpnId", "<VpnId>" ]
            ],
            "region": "us-west-2",
            "title": "Tunnel State",
            "stat": "Maximum",
            "period": 300,
            "yAxis": {
              "left": {
                "label": "State",
                "showUnits": false
              }
            }
          }
        },
        {
          "type": "metric",
          "x": 12,
          "y": 1,
          "width": 12,
          "height": 8,
          "properties": {
            "view": "timeSeries",
            "stacked": false,
            "metrics": [
              [ "AWS/VPN", "TunnelDataIn", "VpnId", "<VpnId>", { "stat": "Average" } ],
              [ "AWS/VPN", "TunnelDataOut", "VpnId", "<VpnId>", { "stat": "Average" } ]
            ],
            "region": "us-west-2",
            "title": "VPN Traffic",
            "period": 300,
            "yAxis": {
              "left": {
                "label": "Traffic",
                "showUnits": true
              }
            }
          }
        }
      ]
    }
  EOF
}
